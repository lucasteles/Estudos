using UnityEngine;
using System.Collections;

public class PlayerBehavior : MonoBehaviour
{

    public Transform mesh;
    public float forceFly;
    private Animator animatorPlayer;
    private float currentTImeToAnim;
    private bool inAnim;

    private gameController controller;
      
	// Use this for initialization
	void Start ()
	{
	    animatorPlayer = mesh.GetComponent<Animator>();
	    controller = FindObjectOfType(typeof (gameController)) as gameController;
	}
	
	// Update is called once per frame
	void Update () {
	    if (Input.GetMouseButtonDown(0) && 
            controller.getCurrentState() == gameStates.INGAME &&
            controller.getCurrentState() != gameStates.GAMEOVER)
	    {
	        inAnim = true;
	        rigidbody2D.velocity = Vector2.zero;
            rigidbody2D.AddForce(new Vector2(0,1) * forceFly );
            soundController.PlaySound(soundsGame.wing);
	    }
        else if (Input.GetMouseButtonDown(0) &&
            controller.getCurrentState() != gameStates.GAMEOVER)
	    {
	        controller.startGame();
            rigidbody2D.AddForce(new Vector2(0, 1) * forceFly);
            soundController.PlaySound(soundsGame.wing);
	    }


        if (controller.getCurrentState() != gameStates.INGAME && 
            controller.getCurrentState() != gameStates.GAMEOVER)
        {
            rigidbody2D.gravityScale = 0f;
            return;
        }
    
        rigidbody2D.gravityScale = 1;
    

	    if (inAnim)
	    {
	        currentTImeToAnim += Time.deltaTime;
	        if (currentTImeToAnim >= 0.2f)
	        {
	            currentTImeToAnim = 0;
	            inAnim = false;
	        }
	    }

        animatorPlayer.SetBool("callFly", inAnim) ;


	    if (rigidbody2D.velocity.y < 0)
	    {
	        mesh.eulerAngles -= new Vector3(0,0,2f);
	        if (mesh.eulerAngles.z < 330 && mesh.eulerAngles.z > 30)
	            mesh.eulerAngles = new Vector3(0, 0, 330);
	        
        }
        else if (rigidbody2D.velocity.y > 0)
        {
            mesh.eulerAngles += new Vector3(0, 0, 2f);
            if (mesh.eulerAngles.z > 30)
                mesh.eulerAngles = new Vector3(0, 0, 30);
            

        }
	}


    void OnCollisionEnter2D(Collision2D coll)
    {
       controller.callGameOver();
       mesh.eulerAngles = new Vector3(0, 0, 0);
       soundController.PlaySound(soundsGame.hit);
    }


}
