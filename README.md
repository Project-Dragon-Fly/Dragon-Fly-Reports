# DragonFly- Reports


This repository houses the latex report template for presenting the works done in the project in a report format.

The 2-week **evaluation sheet** _(aka: **project diary**)_ for the supervisor can be found at directory `evaluation-sheet/`. The recent supervisor evaluation sheet is saved at [evaluation-sheet.pdf](https://drive.google.com/file/d/1sipyniSvpllijGygLhRiPDuqRFlqRQco/view).



The review is a brief works done during a course of a month, detailing of every steps done - an elaborate form of **project diary** _(aka: **evaluation-sheet**)_. The document is saved under the directory `review-reports`. The recent compiled version is saved at [review-report.pdf](https://drive.google.com/file/d/1rtAHmQO8sBy8ahexA9IbREbi8JrnJ1zO/view)

### Compiling Latex document
1. Move into the required directory using `cd` command
2. Compile the main tex file into pdf using pdflatex.
  ```bash
  pdflatex main.tex
  ```
  If your project have bib files, you need a series of compilation
  ```bash
  pdflatex main.tex
  bibtex main
  pdflatex main.tex
  pdflatex main.tex
  ```
  If you prefer to change the location of intermediate build files, use the following command to build and compile
  ```bash
  pdflatex --output-directory=/tmp main.tex
  ```

3. (Optional) Remove the build files using git. The git un-tracked files can be removed using the `clean`. **Warning this removes all un-tracked files from the directory. Check the gitignore file**.
  ```bash
  git clean -xf
  ```
