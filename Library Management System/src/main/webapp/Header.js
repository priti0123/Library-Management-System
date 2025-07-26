
      function openNav() {
          document.getElementById("mySidebar").style.width = "250px";
      }

      function closeNav() {
          document.getElementById("mySidebar").style.width = "0";
      }
     
	  
	  function verifyPassword() {
	             const password = document.getElementById("pword").value;
	             const errorDiv = document.getElementById("password-error");

	             const hasUpperCase = /[A-Z]/.test(password);
	             const hasLowerCase = /[a-z]/.test(password);
	             const hasDigit = /[0-9]/.test(password);
	             const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);
	             const isLongEnough = password.length >= 8;

	             if (!hasUpperCase || !hasLowerCase || !hasDigit || !hasSpecialChar || !isLongEnough) {
	                 errorDiv.textContent = "Password must be at least 8 characters and include uppercase, lowercase, digit, and special character.";
	                 return false;
	             } else {
	                 errorDiv.textContent = "";
	                 return true;
	             }
	         }

	   function validateForm() {
	        return verifyPassword();
	   }