package main

import (
	"fmt"
    "os"
    "bufio"
    "strings"
    "strconv"
	"encoding/json"
)

const WORLD = 1022

func main(){

	file, err := os.Open("quake.txt")
	check(err)
	defer file.Close()

	players := make(map[int]*Player)
	scanner := bufio.NewScanner(file)
	

	for scanner.Scan() {
		info := strings.Split(strings.TrimLeft(scanner.Text(), " ")," ")
		
		switch strings.TrimSpace(info[1]) {
			case "ClientConnect:":
				_id:=getId(info)
				
				players[_id]=&Player{ id: _id, kills: 0  }

			case "ClientUserinfoChanged:":
				_id:=getId(info)
				_name := info[3]

				i:=0						
				for strings.Index(_name,"\\t") == -1 {
					i++
					_name += " "+info[3+i]
				}

				_name = _name[2:strings.Index(_name,"\\t")]
    			players[_id].name = _name 

    		case "Kill:":
    			_id:=getId(info)

    			if (_id != WORLD) {
					players[_id].kills++
				} else {
					_id_cadaver, err := strconv.Atoi(info[3])
					check(err)
					players[_id_cadaver].kills--
				}

    	}

		 
	}
	
	game := new(Game)
	//game.kills = make(map[string]int)

	for _,v := range players {
		//fmt.Println(*v)
		game.Players = append(game.Players, v.name)
		game.Total_kills += v.kills
		//game.kills[v.name] = v.kills
	}
	

	//fmt.Println(game)
	
    //json, _ := json.Marshal(&Game{total_kills: 10, players: []string{"apple", "peach", "pear"}})
    //fmt.Println(string(json))

    res1D := &Game{
        Total_kills: 1,
        Players: []string{"apple", "peach", "pear"}}

    res1B, _ := json.Marshal(res1D)
    fmt.Println(string(res1B))


}


type Response1 struct {
    Page   int
    Fruits []string
}
type Player struct {
	id int
	name string
	kills int
}

type Game struct {
    Total_kills int
    Players []string
   // kills map[string]int
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
