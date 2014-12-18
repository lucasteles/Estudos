using UnityEngine;
using System.Collections;

public enum gameStates
{
    START,
    WAIT,
    INGAME,
    GAMEOVER,
    RANKING
}

public class gameController : MonoBehaviour
{

    public Transform player;
    private Vector3 startPosPlayer;
    private gameStates currentState;
    private int pontos = 0;

    public float timeToRestart;
    private float currentTime;

    //public TextMesh textScore;
    //public TextMesh textShadow;
    public GameObject score;

	// Use this for initialization
	void Start ()
	{
	    
	    startPosPlayer = player.position;
	}
	
	// Update is called once per frame
	void Update () {
	    switch (currentState)
	    {
	        case gameStates.START:
	            player.position = startPosPlayer;
	            currentState = gameStates.WAIT;
	            pontos = 0;
                break;

            case gameStates.WAIT:
                player.position = startPosPlayer;
                
                break;
            case gameStates.INGAME:
                setScoreText(pontos.ToString());

                break;
            case gameStates.GAMEOVER:

	            currentTime += Time.deltaTime;

	            if (currentTime >= timeToRestart)
	            {
	                currentTime = 0;
	                currentState = gameStates.RANKING;
	                setScoreVisible(false);
                    resetGame();
	            }
	            break;
            case gameStates.RANKING:
                player.position = startPosPlayer;
                setScoreVisible(false);
                break;
	    }
	}

    public void startGame()
    {
        currentState = gameStates.INGAME;
        setScoreVisible(true);
    }

    public gameStates getCurrentState()
    {
        return currentState;
    }

    public void callGameOver()
    {
        currentState = gameStates.GAMEOVER;
        
    }

    private void resetGame()
    {
        player.position = startPosPlayer;
        foreach (var item in FindObjectsOfType(typeof(ObstaclesBehavior)) as ObstaclesBehavior[])
            item.gameObject.SetActive(false);

        player.eulerAngles = new Vector3(0, 0, 0);

    }

    public void setScoreText(string txt)
    {
        TextMesh[] meshs = score.GetComponentsInChildren<TextMesh>() ;

        foreach (var item in meshs)
        {
            item.text = txt;
        }


    }

    public void setScoreVisible(bool vis)
    {
        TextMesh[] meshs = score.GetComponentsInChildren<TextMesh>();

        foreach (var item in meshs)
        {
            item.renderer.enabled = vis;
        }


    }


    public void addScore()
    {
        pontos++;
        soundController.PlaySound(soundsGame.point);
    }

}
