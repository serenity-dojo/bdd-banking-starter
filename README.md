# BDD Cucumber Exercise

## 🧠 Overview

This exercise helps you practice writing clear and expressive Gherkin scenarios based on realistic user stories.

**Important:** You do **not** need to write any automation code. This is about expressing good BDD scenarios.

## 📁 Project Structure

```
bdd-cucumber-exercise/
├── features/
│   ├── search.feature               # Gherkin feature file with scenarios to review/extend
│   └── step_definitions/
│       └── search.steps.js          # Step definitions calling the domain logic
├── src/
│   └── partyService.js              # Simulates search logic for parties
├── package.json                     # Project metadata and test script
└── README.md                        # Project instructions
```

## 📝 What You’ll Practice

- Writing Gherkin scenarios from a user story
- Using examples and rules to capture behavior
- Understanding how step definitions and domain logic interact

## 🚀 Getting Started

1. **Install dependencies**

```bash
npm install
```

2. **Run the tests**

```bash
npm test
```

> This runs the Gherkin scenarios using Cucumber.js and verifies them using a simulated in-memory search service.

## 🧪 Try These Tasks

- Add a new scenario to search by **Party ID**
- Add a scenario where **no results are found**
- (Optional) Modify the `partyService.js` logic to sort results alphabetically by name
- Proceed with writing the other scenarios in the workbook.

## 💡 Tip

Use the existing scenarios as inspiration for how to write clear, concrete examples that help clarify behavior for a developer or tester.
