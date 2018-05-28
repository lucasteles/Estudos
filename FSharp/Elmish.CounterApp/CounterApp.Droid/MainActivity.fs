namespace CounterApp.Droid

open System

open Android.App
open Android.Content
open Android.OS
open Android.Runtime
open Android.Views
open Android.Widget
open Xamarin.Forms.Platform.Android
type Resources = CounterApp.Droid.Resource

[<Activity (Label = "CounterApp.Droid", MainLauncher = true, Icon = "@mipmap/icon")>]
type MainActivity() =
    inherit FormsApplicationActivity()
    override this.OnCreate (bundle) =
        base.OnCreate (bundle)

        Xamarin.Forms.Forms.Init (this, bundle)

        this.LoadApplication (new CounterApp.CounterApp ())

