using UnityEngine;
using System.Collections;

public class ObstaclesBehavior : MonoBehaviour
{

    public float speed;
    private gameController controller;
    private bool passed;

	// Use this for initialization
	void Start () {
        controller = FindObjectOfType(typeof(gameController)) as gameController;
	 }
	
	// Update is called once per frame
	void Update () {

	    if (controller.getCurrentState() != gameStates.INGAME)
	    return;
	    

	    transform.position += new Vector3(speed,0,0)* Time.deltaTime;

	    if (transform.position.x < -15)
	    {
	        gameObject.SetActive(false);
	    }


        if (transform.position.x < controller.player.transform.position.x && !passed)
	    {
	        passed = true;
            controller.addScore();

	    }
	}

    void OnEnable()
    {
        passed = false;   
    }
}
