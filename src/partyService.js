/**
 * PartyService.js
 * This module provides functionality to load a list of parties and search for them by name or ID.
 * In a real-world application, this data might be fetched from a database or an API.
 * For the purpose of this example, we will use a simple in-memory array.
 */
let allParties = [];

/**
 * Load a list of party objects into memory
 * @param {Array} partyList - List of parties (each with Party ID, Name, and Type)
 */
function loadParties(partyList) {
    allParties = partyList;
}

/**
 * Search for parties by name or ID (case-insensitive, supports partial matches on name)
 * @param {string} searchTerm - The string entered by the user
 * @returns {Array} - List of parties that match the search term
 */
function searchParties(searchTerm) {
    const lowerSearch = searchTerm.toLowerCase();

    return allParties.filter(party => {
        const nameMatch = party.Name.toLowerCase().includes(lowerSearch);
        const idMatch = party["Party ID"].toLowerCase().includes(lowerSearch);
        return nameMatch || idMatch;
    });
}

module.exports = {
    loadParties,
    searchParties
};
