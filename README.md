# complexipy GitHub Action

This action calculates the cognitive complexity of Python files in your repository using [complexipy](https://rohaquinlop.github.io/complexipy/), an extremely fast Python library written in Rust.

## What is Cognitive Complexity?

Cognitive Complexity is a measure of how difficult it is to understand a piece of code. Unlike traditional metrics like Cyclomatic Complexity, Cognitive Complexity is designed to better reflect how humans perceive code complexity. It considers factors such as nesting, control flow structures, and recursion to provide a more accurate measure of code maintainability.

## Usage

```yaml
name: Check Code Complexity
on: [push, pull_request]

jobs:
  complexity:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Check Python Code Complexity
      uses: rohaquinlop/complexipy-action@v5
      with:
        paths: '.'  # Analyze the entire repository
        ignore_complexity: false # Set to true to ignore complexity checks
```

## Inputs

| Input                    | Description                                                                                                                     | Required | Default                   |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------------------- |
| `paths`                  | Paths to analyze. Can be local paths or a git repository URL.                                                                   | Yes      | `${{ github.workspace }}` |
| `max_complexity_allowed` | Max complexity allowed per function.                                                                                            | No       | `15`                      |
| `quiet`                  | Suppress console output.                                                                                                        | No       | `false`                   |
| `ignore_complexity`      | Ignore complexity threshold and show all functions. By default, complexipy will fail if a function exceeds a certain complexity. | No       | `false`                   |
| `failed`                 | Show only functions that exceed the max complexity threshold.                                                                    | No       | `false`                   |
| `sort`                   | Sort results by complexity (`asc`, `desc`, or `file_name`).                                                                     | No       | `asc`                     |
| `output_csv`             | Generate results in a CSV file.                                                                                                 | No       | `false`                   |
| `output_json`            | Generate results in a JSON file.                                                                                                | No       | `false`                   |
| `exclude`                | Paths to the directories or files to exclude.                                                                                   | No       | `''`                      |

## Examples

### Basic Usage

```yaml
- uses: rohaquinlop/complexipy-action@v5
  with:
    paths: '.'
```

### Ignore Complexity Threshold

```yaml
- uses: rohaquinlop/complexipy-action@v5
  with:
    paths: './src'
    ignore_complexity: true
```

### Set Max Complexity Threshold

```yaml
- uses: rohaquinlop/complexipy-action@v5
  with:
    paths: '.'
    max_complexity_allowed: 10
```

### Show Only Failed Functions

```yaml
- uses: rohaquinlop/complexipy-action@v5
  with:
    paths: '.'
    failed: true
```

### Generate CSV Report

```yaml
- uses: rohaquinlop/complexipy-action@v5
  with:
    paths: '.'
    output_csv: true
```

### Generate JSON Report

```yaml
- uses: rohaquinlop/complexipy-action@v5
  with:
    paths: '.'
    output_json: true
```

### Exclude Directories

```yaml
- uses: rohaquinlop/complexipy-action@v5
  with:
    paths: '.'
    exclude: 'tests/ docs/'
```

## Output

The action will:
1. Analyze Python files in the specified paths
2. Calculate cognitive complexity for each function and file
3. Fail if any file exceeds the complexity threshold, unless `ignore_complexity` is set to `true`
4. Optionally generate a CSV or JSON report

### CSV Output Format

When `output_csv: true`, the action generates a `complexipy.csv` file with the following columns:
- Path
- File Name
- Function Name
- Cognitive Complexity

### JSON Output Format

When `output_json: true`, the action generates a `complexipy.json` file.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.