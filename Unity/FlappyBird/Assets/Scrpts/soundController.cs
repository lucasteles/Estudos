using UnityEngine;
using System.Collections;

public enum soundsGame
{
    die,
    hit,
    menu,
    point,
    wing
}
public class soundController : MonoBehaviour {

    public AudioClip soundDie;
    public AudioClip soundHit;
    public AudioClip soundMenu;
    public AudioClip soundPoint;
    public AudioClip soundWing;

    public static soundController instance;

	// Use this for initialization
	void Start () {
        instance = this;
	}

    public static void PlaySound(soundsGame currentSound)
    {
        switch (currentSound)
        {
            case soundsGame.die:
                {
                    instance.audio.PlayOneShot(instance.soundDie);
                }
                break;
            case soundsGame.hit:
                {
                    instance.audio.PlayOneShot(instance.soundHit);
                }
                break;
            case soundsGame.menu:
                {
                    instance.audio.PlayOneShot(instance.soundMenu);
                }
                break;
            case soundsGame.point:
                {
                    instance.audio.PlayOneShot(instance.soundPoint);
                }
                break;
            case soundsGame.wing:
                {
                    instance.audio.PlayOneShot(instance.soundWing);
                }
                break;
        }
    }
}
