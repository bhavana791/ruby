import React, { useState, useEffect } from 'react';

function App() {
  const [accounts, setAccounts] = useState([]);

  useEffect(() => {
    fetch('http://localhost:3000/salesforce/accounts') // Ensure this URL is correct
      .then((response) => response.json()) // Convert response to JSON
      .then((data) => {
        console.log('Fetched Data:', data); // Log the data here
        setAccounts(data); // Update the state
      })
      .catch((error) => {
        console.error('Error fetching data:', error);
      });
  }, []);

  return (
    <div>
      <h2>Salesforce Accounts</h2>
      <ul>
        {accounts.length > 0 ? (
          accounts.map((account) => (
            <li key={account.Id}>
              {account.Name} (ID: {account.Id})
            </li>
          ))
        ) : (
          <li>No accounts found</li>
        )}
      </ul>
    </div>
  );
}

export default App;
// import React, { useState, useEffect } from 'react';

// function App() {
//   const [accounts, setAccounts] = useState([]);

//   useEffect(() => {
//     fetch('http://localhost:3000/accounts') // Fetch from local Rails API
//       .then((response) => response.json()) // Convert response to JSON
//       .then((data) => {
//         console.log('Fetched Data:', data); // Log the data here
//         setAccounts(data); // Update the state
//       })
//       .catch((error) => {
//         console.error('Error fetching data:', error);
//       });
//   }, []);

//   return (
//     <div>
//       <h2>Salesforce Accounts</h2>
//       <ul>
//         {accounts.length > 0 ? (
//           accounts.map((account) => (
//             <li key={account.salesforce_id}>
//               {account.name} (ID: {account.salesforce_id})
//             </li>
//           ))
//         ) : (
//           <li>No accounts found</li>
//         )}
//       </ul>
//     </div>
//   );
// }

// export default App;

