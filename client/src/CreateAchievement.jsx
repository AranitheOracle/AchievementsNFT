import React, { useState } from 'react';
import { createAchievement } from './utils/eth';

function CreateAchievement() {
  const [recipient, setRecipient] = useState('');
  const [name, setName] = useState('');
  const [description, setDescription] = useState('');
  const [metadataURI, setMetadataURI] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    await createAchievement(recipient, name, description, metadataURI);
    alert('Achievement created!');
  };

  return (
    <form onSubmit={handleSubmit}>
      <input
        type="text"
        placeholder="Recipient Address"
        value={recipient}
        onChange={(e) => setRecipient(e.target.value)}
      />
      <input
        type="text"
        placeholder="Name"
        value={name}
        onChange={(e) => setName(e.target.value)}
      />
      <input
        type="text"
        placeholder="Description"
        value={description}
        onChange={(e) => setDescription(e.target.value)}
      />
      <input
        type="text"
        placeholder="Metadata URI"
        value={metadataURI}
        onChange={(e) => setMetadataURI(e.target.value)}
      />
      <button type="submit">Create Achievement</button>
    </form>
  );
}

export default CreateAchievement;
