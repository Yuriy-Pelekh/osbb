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
    public class RegistrationController : ControllerBase
    {
        private static string ApiKey = "AIzaSyCZk_pPX5pQylzdr1_Ud78zJp8PY9tYFI4";
        private static string Bucket = "steposbb.appspot.com";

        // URL for tests: api/registration/YOUR_EMAIL, YOUR_PASSWORD, YOUR_NAME
        [HttpGet("{email}, {password}, {name}")]
        [AllowAnonymous]
        public async Task<ActionResult> SignUpAsync(string email, string password, string name)
        {
            try
            {
                var auth = new FirebaseAuthProvider(new FirebaseConfig(ApiKey));

                var a = await auth.CreateUserWithEmailAndPasswordAsync(email, password, name, true);

            }
            catch (Exception ex)
            {
                ModelState.AddModelError(string.Empty, ex.Message);
            }
            return Ok("Verify your email by link in letter.");
        }
    }
}