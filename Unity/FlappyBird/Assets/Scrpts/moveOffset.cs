using UnityEngine;
using System.Collections;

public class moveOffset : MonoBehaviour
{

    private Material currentMaterial;
    public float speed;
    private float offset;
    private gameController controller;
	// Use this for initialization
	void Start ()
	{
        controller = FindObjectOfType(typeof(gameController)) as gameController;
	    currentMaterial = renderer.material;
	}
	
	// Update is called once per frame
	void Update ()
	{
        if (controller.getCurrentState() != gameStates.INGAME)
            return;

	    offset += 0.001f;
        currentMaterial.SetTextureOffset("_MainTex",new Vector2(offset*speed,0));
	}
}
