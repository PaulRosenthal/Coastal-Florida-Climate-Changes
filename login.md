---
layout: default
title: Sea Florida Change Login Page
display-title: "Sea Florida Change Login Page"
tagline: Visualize Sea Level Changes and Threats to Northwest Florida's Coastal Areas
description: Visualize sea level changes and see what the future holds in northwest Florida's coastal areas.
---

<img src="/img/logo_transparent.png" alt="Sea Florida Change Logo" style="height:200px;width:200px;margin-left:auto;margin-right:auto;display:block">

 <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@1"></script>
  <script>
var SUPABASE_URL = 'https://zexltivbujgutoeekosn.supabase.co'
var SUPABASE_KEY =
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpleGx0aXZidWpndXRvZWVrb3NuIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODc1NjY1MjksImV4cCI6MjAwMzE0MjUyOX0.Rv9EP8U0LWKM9qbxNzwafk-s91HftqesRziil_jX-5U'

var supabase = supabase.createClient(SUPABASE_URL, SUPABASE_KEY)
window.userToken = null

document.addEventListener('DOMContentLoaded', function (event) {
  var signUpForm = document.querySelector('#sign-up')
  signUpForm.onsubmit = signUpSubmitted.bind(signUpForm)

  var logInForm = document.querySelector('#log-in')
  logInForm.onsubmit = logInSubmitted.bind(logInForm)

  var userDetailsButton = document.querySelector('#user-button')
  userDetailsButton.onclick = fetchUserDetails.bind(userDetailsButton)

  var logoutButton = document.querySelector('#logout-button')
  logoutButton.onclick = logoutSubmitted.bind(logoutButton)
})

const signUpSubmitted = (event) => {
  event.preventDefault()
  const email = event.target[0].value
  const password = event.target[1].value

  supabase.auth
    .signUp({ email, password })
    .then((response) => {
      response.error ? alert(response.error.message) : setToken(response)
    })
    .catch((err) => {
      alert(err)
    })
}

const logInSubmitted = (event) => {
  event.preventDefault()
  const email = event.target[0].value
  const password = event.target[1].value

  supabase.auth
    .signIn({ email, password })
    .then((response) => {
      response.error ? alert(response.error.message) : setToken(response)
    })
    .catch((err) => {
      alert(err.response.text)
    })
}

const fetchUserDetails = () => {
  alert(JSON.stringify(supabase.auth.user()))
}

const logoutSubmitted = (event) => {
  event.preventDefault()

  supabase.auth
    .signOut()
    .then((_response) => {
      document.querySelector('#access-token').value = ''
      document.querySelector('#refresh-token').value = ''
      alert('Logout successful')
    })
    .catch((err) => {
      alert(err.response.text)
    })
}

function setToken(response) {
  if (response.user.confirmation_sent_at && !response?.session?.access_token) {
    alert('Confirmation Email Sent')
  } else {
    document.querySelector('#access-token').value = response.session.access_token
    document.querySelector('#refresh-token').value = response.session.refresh_token
    alert('Logged in as ' + response.user.email)
  }
}
</script>
</head>

 <body>
    <div class='container'>
        <div class='section'>
            <h1>Supabase Auth Example</h1>
        </div>
        <div class='section'>
            <a href="https://github.com/supabase/supabase/tree/master/examples/auth/javascript-auth">View the code on GitHub</a>
        </div>
        <div class='section'>
            <form id='sign-up'>
                <h3>Sign Up</h3>
                <label>Email</label><input type='email' name='email' />
                <label>Password</label><input type='password' name='password' />
                <input type='submit'>
            </form>
        </div>
        <div class='section'>
            <form id='log-in'>
                <h3>Log In</h3>
                <label>Email</label><input type='email' name='email' />
                <label>Password</label><input type='password' name='password' />
                <input type='submit'>
            </form>
        </div>
        <div class='section'>
            <form id='validate'>
                <h3>Access Token</h3>
                <input readonly=readonly type='text' id='access-token' /> <small>Default expiry is 60 minutes</small>
                <h3>Refresh Token</h3>
                <input readonly=readonly type='text' id='refresh-token' /> <small>Supabase-js will use this to automatically fetch a new accessToken for you every 60 mins whilst the client is running</small> 
            </form>
        </div>
        <div class='section'>
            <h3>Fetch User Details</h3>
            <button id='user-button'>Fetch</button>
        </div>
        <div class='section'>
            <h3>Logout</h3>
            <button id='logout-button'>Logout</button>
        </div>
    </div>
</body>