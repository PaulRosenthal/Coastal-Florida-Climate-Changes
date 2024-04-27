import React, { useState, useEffect } from 'react';

async function fetchFlagStatus() {
    try {
      const response = await fetch('https://raw.githubusercontent.com/PaulRosenthal/Panama-City-Beach-Flags-Alexa-Skill/main/current-flag-status.txt');
      const data = await response.text();
      return data;
    } catch (error) {
      console.error(error);
      // Handle errors here (e.g., set a state variable for error message)
    }
  }
  
  function CurrentFlagStatus() {
    const [color, setColor] = useState('Fetching flag status...'); // Initial color
  
    useEffect(() => {
      fetchFlagStatus()
        .then(data => setColor(data)); // Update color state with fetched data
    }, []);
  
    return (
      <div>
        <p>
          Color is: {color}
        </p>
      </div>
    );
  }
  
  export default CurrentFlagStatus;