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
    public class RefreshPasswordController : ControllerBase
    {
        private static string ApiKey = "AIzaSyCZk_pPX5pQylzdr1_Ud78zJp8PY9tYFI4";
        private static string Bucket = "steposbb.appspot.com";

        // URL for tests: api/refreshpassword/YOUR_EMAIL
        [HttpGet("{email}")]
        [AllowAnonymous]
        public ActionResult SignUp(string email)
        {
            try
            {
                var auth = new FirebaseAuthProvider(new FirebaseConfig(ApiKey));

                var ab = auth.SendPasswordResetEmailAsync(email);

            }
            catch (Exception ex)
            {
                ModelState.AddModelError(string.Empty, ex.Message);
            }
            return Ok("Check your email.");
        }
    }
}