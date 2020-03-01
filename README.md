# Demographics of a School

Project for gaining some hands-on experience in Elixir.

## Getting Started
1. [Install Elixir](https://elixir-lang.org/install.html)
2. Clone the project
3. Run `$ iex -S mix` under the project directory

### Modules
#### School
- #classes: Retrieves data of all people in the school
- #demographics: First filters out people that are less than 30, then grouped by role and first name (through module Util)

#### Util
Util module for converting data for `School.classes`.
