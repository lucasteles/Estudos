package main

import (
	"bufio"
	"encoding/json"
	"fmt"
	"os"
	"strconv"
	"strings"
)

const WORLD = 1022

func main() {

	file, err := os.Open("quake.txt")
	check(err)
	defer file.Close()
	var world_kills int
	var players map[int]*Player
	games := make(map[string]*Game)
	scanner := bufio.NewScanner(file)
	inGame := false

	//contagem de mortes pelo mundo
	for scanner.Scan() {
		info := strings.Split(strings.TrimLeft(scanner.Text(), " "), " ")
		switch strings.TrimSpace(info[1]) {
		case "InitGame:":
			if (inGame)	{
				games = makeGame(players, games, world_kills)
			}
			world_kills = 0
			players = make(map[int]*Player)
			inGame = true
		case "ClientConnect:":
			_id := getId(info)

			if _, ok := players[_id]; !ok {
				players[_id] = &Player{id: _id, kills: 0}
			}

		case "ClientUserinfoChanged:":
			_id := getId(info)
			_name := info[3]

			i := 0
			for strings.Index(_name, "\\t") == -1 {
				i++
				_name += " " + info[3+i]
			}
			_name = _name[2:strings.Index(_name, "\\t")]
			players[_id].name = _name

		case "Kill:":
			_id := getId(info)

			if _id != WORLD {
				players[_id].kills++
			} else {
				_id_cadaver, err := strconv.Atoi(info[3])
				check(err)
				players[_id_cadaver].kills--
				world_kills++
			}

		case "ShutdownGame:":
			inGame = false
			games = makeGame(players, games, world_kills)
		}
	}

	json, _ := json.Marshal(games)

	fmt.Println(string(json))

	// escreve saida
	f, err := os.Create("log.json")
	defer f.Close()
	w := bufio.NewWriter(f)
	n, err := w.WriteString(string(json))
	check(err)
	fmt.Printf("wrote %d bytes\n", n)
	w.Flush()

}

type Player struct {
	id    int
	name  string
	kills int
}

type Game struct {
	Total_kills int `json:"total_kills"`
	Players     []string `json:"players"`
	Kills       map[string]int `json:"kills"`
}

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func getId(info []string) int {
	_id, err := strconv.Atoi(info[2])
	check(err)
	return _id
}

func stringInSlice(a string, list []string) bool {
    for _, b := range list {
        if b == a {
            return true
        }
    }
    return false
}

func makeGame(players map[int]*Player, games map[string]*Game, world_kills int) map[string]*Game {
	game := new(Game)
	game.Kills = make(map[string]int)

	for _, v := range players {

		if !stringInSlice(v.name, game.Players) {
		 	game.Players = append(game.Players, v.name)
		}				

		game.Total_kills += v.kills
		game.Kills[v.name] += v.kills
	}
	game.Total_kills += world_kills*2
	key := "game_" + strconv.Itoa(len(games)+1)
	games[key] = game

	return games
}