using Facebook;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace facebook_robot.Controllers
{
    public class HomeController : Controller
    {
       
        private string AlbumId ;
        private string AppId ;
        private string AppSecret ;
        private string PhotoPath ;


        public HomeController()
        {
            Func<string, string> get = e => ConfigurationManager.AppSettings[e].ToString();

            AlbumId  = get("AlbumId");
            AppId     = get("AppId");
            AppSecret = get("SecretKey");
            PhotoPath = get("PhotoFolder");

        }
        
        public string GetFacebookLoginUrl()
        {
            dynamic parameters = new ExpandoObject();
            parameters.client_id = AppId;
            parameters.redirect_uri = "http://localhost:64636/home/retornofb";
            parameters.response_type = "code";
            parameters.display = "page";

            
            var extendedPermissions = "public_profile,user_photos";
            //var extendedPermissions = "public_profile,user_friends,email,user_about_me,user_actions.books,user_actions.fitness,user_actions.music,user_actions.news,user_actions.video,user_birthday,user_education_history,user_events,user_games_activity,user_hometown,user_likes,user_location,user_managed_groups,user_photos,user_posts,user_relationships,user_relationship_details,user_religion_politics,user_tagged_places,user_videos,user_website,user_work_history,read_custom_friendlists,read_insights,read_audience_network_insights,read_page_mailboxes,manage_pages,publish_pages,publish_actions,rsvp_event,pages_show_list,pages_manage_cta,pages_manage_instant_articles,ads_read,ads_management";
            parameters.scope = extendedPermissions;

            var _fb = new FacebookClient();
            var url = _fb.GetLoginUrl(parameters);

            return url.ToString();
        }

        public ActionResult RetornoFb()
        {
            var _fb = new FacebookClient();
            FacebookOAuthResult oauthResult;

            _fb.TryParseOAuthCallbackUrl(Request.Url, out oauthResult);

            if (oauthResult.IsSuccess)
            {
                //Pega o Access Token "permanente"
                dynamic parameters = new ExpandoObject();
                parameters.client_id = AppId;
                parameters.redirect_uri = "http://localhost:64636/home/retornofb";
                parameters.client_secret = AppSecret;
                parameters.code = oauthResult.Code;

                dynamic result = _fb.Get("/oauth/access_token", parameters);

                var accessToken = result.access_token;

                //TODO: Guardar no banco
                Session.Add("FbUserToken", accessToken);
            }
            else
            {
                // tratar
            }

            return RedirectToAction("Index");
        }

        public ActionResult Index()
        {
            ViewBag.UrlFb = GetFacebookLoginUrl();

            return View();
        }


        public ActionResult PublicarMensagem()
        {
            if (Session["FbuserToken"] != null)
            {
                var _fb = new FacebookClient(Session["FbuserToken"].ToString());

                //Postar uma mensagem na timeline
                dynamic messagePost = new ExpandoObject();
                messagePost.picture = "";
                messagePost.link = "";
                messagePost.name = "Post name.";
                messagePost.caption = " Post Caption";
                messagePost.description = "post description";
                messagePost.message = "Mensagem de testes da aplicação";

                try
                {
                    var postId = _fb.Post("me/feed", messagePost);
                }
                catch (FacebookOAuthException ex)
                {
                    //handle oauth exception
                }
                catch (FacebookApiException ex)
                {
                    //handle facebook exception
                }
            }

            return RedirectToAction("Index");
        }

        class filesOrdered {
            public string file { get; set; }
            public int id { get; set; }

        }



        public ActionResult PublicarFotos()
        {
            if (Session["FbuserToken"] != null)
            {

                var path = PhotoPath;

                var files_text = Directory.GetFiles(path);

                var files = files_text.Select(e=> new filesOrdered { file=e, id = int.Parse(Path.GetFileNameWithoutExtension(e) )   } ).OrderBy(e => e.id).ToArray();



                foreach (var item in files)
                {
               
                    
                    var _fb = new FacebookClient(Session["FbuserToken"].ToString());
                    //upload de imagem
                    FacebookMediaObject media = new FacebookMediaObject
                    {
                        FileName = "Nome da foto",
                        ContentType = "image/jpeg"
                    };

                    byte[] img = System.IO.File.ReadAllBytes(item.file);
                    media.SetValue(img);

                    dynamic parameters = new ExpandoObject();
                    var xx = Path.GetFileNameWithoutExtension(item.file); 
                    parameters.source = media;
                    parameters.message = Path.GetFileName(item.file);
                    parameters.name =  xx;
                    parameters.caption =  xx;
                    parameters.description =  xx;
                    parameters.privacy = new Dictionary<string,string> { ["value"] = "EVERYONE" };


                    try
                    {
                        dynamic result = _fb.Post(AlbumId+ "/photos", parameters);

                        System.IO.File.Delete(item.file);

                    }
                    catch (Exception ex)
                    {
                        throw ex;

                    }



                }


            }
            return RedirectToAction("Index");

        }
    }

}