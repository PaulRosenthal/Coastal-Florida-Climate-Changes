---
layout: default
title: Sea Florida Change Login Page
display-title: "Sea Florida Change Login Page"
tagline: Visualize Sea Level Changes and Threats to Northwest Florida's Coastal Areas
description: Visualize sea level changes and see what the future holds in northwest Florida's coastal areas.
---

<img src="/img/logo_transparent.png" alt="Sea Florida Change Logo" style="height:200px;width:200px;margin-left:auto;margin-right:auto;display:block">
  
 <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
<link rel="stylesheet" href="style.css" />
  <title>JS Auth</title>
</head>
<body>
  
<form>
  <h3 class="text-center">Registration / Login Form</h3>
  <!-- Email input -->
  <div class="form-outline mb-4">
    <input type="email" id="inputEmail" class="form-control" />
    <label class="form-label" for="form2Example1">Email address</label>
  </div>

  <!-- Password input -->
  <div class="form-outline mb-2">
    <input type="password" id="inputPassword" class="form-control" />
    <label class="form-label" for="form2Example2">Password</label>
  </div>

  <!-- 2 column grid layout for inline styling -->
  <div class="row mb-4">
    <div class="col d-flex justify-content-center">
    
    </div>
  </div>

  <!-- Submit button -->
  <button type="submit" class="btn btn-primary btn-block mb-4" id="signin">Sign in</button>
  <button type="submit" class="btn btn-primary btn-block mb-4" id="signup">Sign Up</button>
  </div>
</form>

<h4 id="user">Welcome user: </h4>

  <script src="https://www.gstatic.com/firebasejs/8.2.4/firebase-app.js"></script>
  <script src="https://www.gstatic.com/firebasejs/8.2.4/firebase-auth.js"></script>
  <script>
    var firebaseConfig = {
    apiKey: "AIzaSyChrzz2VbgRyC7N06oNkLbu-U9qdVNeBuY",
    authDomain: "sea-florida-change.firebaseapp.com",
    databaseURL: "https://sea-florida-change-default-rtdb.firebaseio.com",
    projectId: "sea-florida-change",
    storageBucket: "sea-florida-change.appspot.com",
    messagingSenderId: "323384256569",
    appId: "1:323384256569:web:35605987bc4113b7dcc5e8"
  };
  //Initialize Firebase
  firebase.initializeApp(firebaseConfig);

  const auth = firebase.auth()


  //Signup Function
  let signUpButton = document.getElementById('signup')
  signUpButton.addEventListener("click", (e) => {
    //Prevent Default Form Submission Behavior
    e.preventDefault()
    console.log("clicked")

    var email = document.getElementById("inputEmail")
    var password = document.getElementById("inputPassword")
    
    auth.createUserWithEmailAndPassword(email.value, password.value)
    .then((userCredential) => {
      location.reload();
      // Signed in 
      var user = userCredential.user;
      console.log("user",user.email)
    })
    .catch((error) => {
      var errorCode = error.code;
      var errorMessage = error.message;
      console.log("error code", errorCode)
      console.log("error Message", errorMessage)
    });
  })








  let signInButton = document.getElementById('signin')
  signInButton.addEventListener("click", (e) => {
    //Prevent Default Form Submission Behavior
    e.preventDefault()
    console.log("clicked")

    var email = document.getElementById("inputEmail")
    var password = document.getElementById("inputPassword")

    auth.signInWithEmailAndPassword(email.value, password.value) 
    .then((userCredential) => {
      // location.reload();
      // Signed in 
      var user = userCredential.user;
      console.log("user",user.email)
      window.location = "dash.html";
    })
    .catch((error) => {
      var errorCode = error.code;
      var errorMessage = error.message;
      // alert("error code", errorCode)
      alert( errorMessage)
    });
   })



//This method gets invoked in the UI when there are changes in the authentication state:
// 1). Right after the listener has been registered
// 2). When a user is signed in
// 3). When the current user is signed out
// 4). When the current user changes

//Lifecycle hooks
auth.onAuthStateChanged(function(user) {
  if (user) {

    var email = user.email
  
    var users = document.getElementById("user")
    var text = document.createTextNode(email);

    users.appendChild(text);

    console.log(users)
    //is signed in
  } else {
    //no user signed in
  }
})
</script>
</body>