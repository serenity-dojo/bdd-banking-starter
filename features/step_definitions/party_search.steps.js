const { Given, When, Then } = require('@cucumber/cucumber');
const assert = require('assert');
const partyService = require('../../src/partyService');

let searchResults = [];

Given('the following parties exist:', function (dataTable) {
    const parties = dataTable.hashes();
    partyService.loadParties(parties);
});

When('Connie searches for {string}', function (searchTerm) {
    searchResults = partyService.searchParties(searchTerm);
});

Then('the search results should contain exactly:', function (expectedTable) {
    const expectedResults = expectedTable.hashes();
    assert.deepStrictEqual(searchResults, expectedResults);
});
