// This config based on @commitlint/config-conventional

module.exports = {
  rules: {
    // Body of commit needs to start from empty string
    "body-leading-blank": [2, "always"],

    // Bottom of commit needs to start from empty string
    "footer-leading-blank": [2, "always"],

    // Max length of header is 72 chars
    "header-max-length": [2, "always", 72],

    // Scop-case only in lower-case
    "scope-case": [2, "always", "lower-case"],

    // Description has no to be empty
    "subject-empty": [2, "never"],

    // Description ends with '.'
    "subject-full-stop": [2, "never", "."],

    // Type-case only in lower-case
    "type-case": [2, "always", "lower-case"],

    // Type has no to be empty
    "type-empty": [2, "never"],

    // Available types of commits
    "type-enum": [
      2,
      "always",
      [
        "build",
        "ci",
        "chore",
        "docs",
        "feat",
        "fix",
        "perf",
        "refactor",
        "revert",
        "style",
        "test"
      ]
    ]
  }
};
