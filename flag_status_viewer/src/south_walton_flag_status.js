import React, { useState, useEffect } from 'react';

async function FetchSouthWaltonFlagStatus() {
    try {
      const response = await fetch('https://raw.githubusercontent.com/PaulRosenthal/South-Walton-Beach-Flags-Alexa-Skill/main/current-flag-status.txt');
      const data = await response.text();
      return data;
    } catch (error) {
      console.error(error);
      // Handle errors here (e.g., set a state variable for error message)
    }
  }
  
  function CurrentSouthWaltonFlagStatus() {
    const [color, setColor] = useState('Fetching flag status...'); // Initial color
  
    useEffect(() => {
      FetchSouthWaltonFlagStatus()
        .then(data => setColor(data)); // Update color state with fetched data
    }, []);
  
    return (
      <div>
        <h2>South Walton</h2>
        <p>
          {color}
        </p>
      </div>
    );
  }
  
  export default CurrentSouthWaltonFlagStatus;