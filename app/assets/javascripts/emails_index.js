console.log("je suis le js de index, je me charge à chaque page");

// each time emails#index in loaded, email with read = true are set to bold
var emailReads = document.getElementsByClassName("email-read");
var l = emailReads.length;
console.log(l);

for (let count = 0; count <= l-1; count++){

    emailReads[count].style.color = "red";
    console.log("bold");

}
