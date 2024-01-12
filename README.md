# Staff Finder [![gh-actions-build-status](https://github.com/Juke34/ifb-staff/workflows/build/badge.svg)](https://github.com/Juke34/ifb-staff/actions?workflow=build)

IFB interactive staff info page. https://juke34.github.io/ifb-staff/

# IFB staff

## Content

This repository contains data used to generate the interactive page.

IFB-staff
|___ assests           # folder containing logo and style sheet for page rendering
|___ trombinoscope     # folder containing information related to individuals
|    |__ photo         # folder with photo of individuals. Must be firstname-lastname.jpg 
|    |__ publication   # folder with publication of the individuals. Must be firstname-lastname.bib
|    |__ staff         # folder with description of the individuals. Must be firstname-lastname.yaml
|___ index.Rmd         # Markdown file executed by github actions to generate the the interactive page.  


## How this information is used

The master branch contains the GitHub action script that runs all the tasks and the Rmarkdown document that ends up as the rendered HTML page. The rendered material is made available publicly on the gh-pages branch.
The material used as input is the YAML files avaiable in `trombinoscope/staff`. Each YAML file is parsed 
and, provided the setting `active:` is set to `true`, the
corresponding staff member is added to the staff listing, and a staff page is generated.

This web page is rebuilt automatically when any changes to the master repo is made.

**Build**  

The linux environment, dependencies, R and necessary R packages are installed or recovered from cache. Repo master branch is pulled down, images are processed using Imagemagick into 100px x 100px circular PNGs. The Rmarkdown script reads information from the YAML files and finally displays a tabular interactive page. The rendered HTML page, it's dependencies, assets and processed images are pushed to NBISweden/staff-finder gh-pages branch.

## How to create a new entry

Entries are located in the `staff` folder.
In order to add yourself to the staff pages etc., create a file
`firstname-lastname.yaml` and add your information.  Use the
`TEMPLATE.yaml` file as a starting point and look at the existing YAML
files to see how you may fill it out.

* Note that you can use markdown syntax for the `bio:` entry, e.g. for links.
* Add a photo of yourself in the `img` subdirectory, and make sure that
the file name matches the entry `image:` in your YAML file.  Consider
adjusting the image so that it is no more than about 400 pixels wide and
less than 200 KB in file size.
* If you wish, you can include selected publications on your
profile page.  For this, add a publication list in BibTeX format
in the subdirectory `publications`, and specify the file name in
the YAML file, e.g. `bibtex: john-doe.bib`.  There are online
tools to create bibtex entries from pubmed id:s and doi:s, e.g.
[texmed](http://www.bioinformatics.org/texmed/) and
[doi2bib](http://www.doi2bib.org/#/doi).

You can either clone the repository and create a new branch and commit
your changes there, then push your changes, or simply use the Github web
interface to create/upload a new file. Create a new
branch there and commit all your changes.  You can then create a pull
request to ask a webadmin to review and merge your changes.

The YAML format is described at [yaml.org](https://yaml.org/). You can
check that a YAML file is valid by pasting the content at
[yamllint.com](http://www.yamllint.com/).

* Keep in mind that `:` is a reserved character, so if you for some
reason have a `:` character in e.g. your bio, please replace it with the
escape code `&#x3A;`.
* Multi-line strings should be indented.
* Create paragraph breaks in bio by inserting two blank lines.


## GDPR

The staff YAML files contain personal data (e.g. first name).
The data you share are used to set the IFB staff list website. The data are used only for that purpose. 
You can modify or remove any information via a PR or by contacting the owner or any contributor of this repository.
You must ask permission to any person you modify or add information.
You must verify identity of any person asking you to perform a modification. 
More about GDPR [here](https://gdpr-info.eu).

## Further information

Please ask for help by [opening an issue in this
repository](https://github.com/Juke34/ifb-staff/issues)
(this is the preferred way), or ask in the IFB Slack, or email
`xxx@ifb.fr` if anything is unclear or broken.

## Acknowledgement

This work is based on [staff-finder](https://github.com/NBISweden/staff-finder) developed by (NBIS)[https://nbis.se].
