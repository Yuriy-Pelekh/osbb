using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Firebase.Auth;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace LessonWebApi1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private static string ApiKey = "AIzaSyCZk_pPX5pQylzdr1_Ud78zJp8PY9tYFI4";
        private static string Bucket = "steposbb.appspot.com";

        // URL for tests: api/auth/YOUR_EMAIL, YOUR_PASSWORD
        [HttpGet("{email}, {password}")]
        [AllowAnonymous]
        public async Task<ActionResult> Login(string email, string password)
        {
            try
            {
                var auth = new FirebaseAuthProvider(new FirebaseConfig(ApiKey));
                var ab = await auth.SignInWithEmailAndPasswordAsync(email, password);
                
                string token = ab.FirebaseToken;
                var user = ab.User;
                if (token != "")
                {
                    return Ok("You are logged in, " + ab.User.DisplayName + "\nEmail: " + ab.User.Email);
                }
                else
                {
                    // Setting.
                    return Ok("Invalid username or password.");
                }
            }
            catch (Exception ex)
            {
                // Info
                Console.Write(ex);
            }
            return Ok("Something wrong happened");
        }
    }
}
