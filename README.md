# Course 046195 - Introduction to Machine learning

Website: <https://technion046195.github.io/semester_2019_winter/>

Full website (with hidden pages): <https://technion046195.github.io/semester_2019_winter/?full>

## Setup

Run setup.sh (works only on linux).

This will:

- Create a Python virtual environment in a folder named venv.
- Install all relevant python packages to the virtual environment according to the *requirements.txt* file.
- Install Ruby + Bundler

## Serve  Locally

Run:

```bash
bundle exec jekyll serve --livereload
```

And go to: <localhost:4000>

## Known Issus

- Apparently in markdown the convention is to use the double dollar sign ("$$") for both inline and display equations.

- For some reason Jekyll replaces the combination "\{" with "{". This is problematic when trying to use curly brackets in LaTeX equations such as "\left\{x\right\}". A workaround is to use "\lbrace" and "rbrace" instead: "\left\brace x\right\rbrace"
