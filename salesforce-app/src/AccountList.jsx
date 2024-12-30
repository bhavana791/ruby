import React, { useState, useEffect } from 'react';

const AccountList = () => {
  // State to store accounts
  const [accounts, setAccounts] = useState([]);
  const [loading, setLoading] = useState(true); // To handle loading state
  const [error, setError] = useState(null); // To handle errors

  // Fetch data from the Rails API when the component mounts
  useEffect(() => {
    fetch('http://localhost:3000/salesforce/accounts')
      .then((response) => {
        // Check if the response is successful
        if (!response.ok) {
          throw new Error('Failed to fetch accounts');
        }
        return response.json();
      })
      .then((data) => {
        setAccounts(data); // Set the fetched data in the state
        setLoading(false);  // Set loading state to false
      })
      .catch((err) => {
        setError(err.message); // Handle errors
        setLoading(false); // Set loading state to false even on error
      });
  }, []); // Empty dependency array means this effect runs once on mount

  // Display loading message or error if any
  if (loading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  // Render the list of accounts
  return (
    <div>
      <h2>Salesforce Accounts</h2>
      <ul>
        {accounts.map((account) => (
          <li key={account.Id}>
            {account.Name} (ID: {account.Id})
          </li>
        ))}
      </ul>
    </div>
  );
};

export default AccountList;
