using System.Security.Cryptography;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class spawnController : MonoBehaviour
{
    public float maxHight;
    public float minHight;
    
    public float rateSpawn;
    private float currentRateSpawn;

    public GameObject tubePrefab;

    private gameController controller;
    public int maxSpawnTubes;
    public List<GameObject> tubes;

	// Use this for initialization
	void Start () {
        controller = FindObjectOfType(typeof(gameController)) as gameController;
	    for (int i = 0; i < maxSpawnTubes; i++)
	    {
            GameObject temp = Instantiate(tubePrefab) as GameObject;
	        temp.SetActive(false);
            tubes.Add(temp);
             
	    }
	    currentRateSpawn = rateSpawn;

	}
	
	// Update is called once per frame
	void Update ()
	{
        if (controller.getCurrentState() != gameStates.INGAME)
            return;

	    currentRateSpawn += Time.deltaTime;
	    if (currentRateSpawn >= rateSpawn)
	    {
	        currentRateSpawn = 0;
            spawn();
	    }
	}

    private void spawn()
    {
        float randHight = Random.Range(maxHight, minHight);
        GameObject tmp = null;
        for (int i = 0; i < maxSpawnTubes; i++)
        {
            if (!tubes[i].activeSelf)
            {
                tmp = tubes[i];
                break;
            }
        }

        if (tmp != null)
        {
            tmp.transform.position = new Vector3(transform.position.x, randHight, transform.position.z);
            tmp.SetActive(true);
        }

    }
}
