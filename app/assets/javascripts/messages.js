

function masquerAlerte()
    {
      if (document.getElementById("zonealert")) {
          document.getElementById("zonealert").style.visibility='hidden';
      }
    }
 window.setTimeout(masquerAlerte, 3000);