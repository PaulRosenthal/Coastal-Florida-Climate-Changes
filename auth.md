---
layout: default
title: Authentication Implementation Tests
tagline: Beta
---

This page is used to test the implementation of authentication and database connectivity.

# User's Favorite Location

Favorite location is: <span id="favorite_location"></span>.

Example from https://github.com/supabase/supabase/tree/master/examples/javascript-auth:
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

<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js"></script>

<script>
var SUPABASE_URL = 'https://efwajfbepjqvkauapgou.supabase.co'
var SUPABASE_KEY =
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVmd2FqZmJlcGpxdmthdWFwZ291Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NDY4OTIwMjYsImV4cCI6MTk2MjQ2ODAyNn0.iPknN2ty9_G90IQomIbCewrGr888eqPFu_l63yYnLkU'

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

<!-- <script>

var fav_location = 1

const options = {
  schema: 'public',
  autoRefreshToken: true,
  persistSession: true,
  detectSessionInUrl: true
}
  const { createClient } = supabase
  const _supabase = createClient('https://efwajfbepjqvkauapgou.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVmd2FqZmJlcGpxdmthdWFwZ291Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NDY4OTIwMjYsImV4cCI6MTk2MjQ2ODAyNn0.iPknN2ty9_G90IQomIbCewrGr888eqPFu_l63yYnLkU', options)

  console.log('Supabase Instance: ', _supabase)


async function getLocations() {
  let { data, error } = await _supabase.from('locations').select('id, full_name').eq('id', fav_location)
  return data
}

getLocations().then((data) => { 
  console.log(data)
  document.getElementById("favorite_location").innerHTML = data[0].full_name;
})

</script>
 -->