---
layout: default
title: CHAMP Home
nav_order: 1
description: "Cornell-Holland Ab-initio Materials Package"
permalink: /
---

# Cornell-Holland Ab-initio Materials Package
{: .fs-7 .mb-4 .mr-2}

The Cornell-Holland Ab-initio Materials Package (CHAMP) is a quantum Monte Carlo suite of programs for electronic structure calculations of atomic and molecular systems. The code is a sister code of the homonymous program originally developed by Cyrus Umrigar
and Claudia Filippi of which it retains the accelerated Metropolis method and the efficient
diffusion Monte Carlo algorithms.

The European branch of the code is currently developed by Claudia Filippi and Saverio Moroni,
with significant contributions by Claudio Amovilli and other collaborators.

{: .fs-5 .fw-300 }

[Get the code from GitHub][CHAMP repo]{: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }

---
<!-- # Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc} -->


CHAMP has three basic capabilities:

* Metropolis or variational Monte Carlo (VMC)
* Diffusion Monte Carlo (DMC)
* Optimization of many-body wave functions by energy minimization (VMC) for ground and excited states

Noteworthy features of CHAMP are:

* Efficient wave function optimization also in a state-average fashion for multiple states of the same symmetry (VMC)
* Efficient computation of analytical interatomic forces (VMC)
* Compact formulation for a fast evaluation of multi-determinant expansions and their derivatives (VMC and DMC)
* Multiscale VMC and DMC calculations in classical point charges (MM), polarizable continuum model (PCM), and polarizable force fields (MMpol)



## About the project

CHAMP &copy; 2022-{{ "now" | date: "%Y" }} by [Prof. Claudia Filippi](https://www.utwente.nl/en/tnw/ccp/people/academic-staff/filippi/).

### License

CHAMP is distributed by an [GPl-3.0 license](https://github.com/filippi-claudia/champ/blob/main/LICENSE).

#### Thank you to the contributors of CHAMP!

<!-- <ul class="list-style-none">
{% for contributor in site.github.contributors %}
  <li class="d-inline-block mr-1">
     <a href="{{ contributor.html_url }}"><img src="{{ contributor.avatar_url }}" width="32" height="32" alt="{{ contributor.login }}"></a>
  </li>
{% endfor %}
</ul> -->



### Source code usage and collaboration

{: .warning }

You should neither obtain this program from any other source nor should you distribute it or any portion thereof to any person, including people in the same research group.
It is expected that users of the programs will do so in collaboration with one of the principal authors. This serves to ensure both that the programs are used correctly and that the principal authors get adequate scientific credit for the time invested in developing the programs.

### Usual disclaimer

{: .note }

The authors make no claims about the correctness of the program suite and people who use it do so at their own risk.

----

[^1]: The [source file for this page] uses all three markup languages.

[^2]: [It can take up to 10 minutes for changes to your site to publish after you push the changes to GitHub](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll#creating-your-site).

[Jekyll]: https://jekyllrb.com
[Markdown]: https://daringfireball.net/projects/markdown/
[Liquid]: https://github.com/Shopify/liquid/wiki
[Front matter]: https://jekyllrb.com/docs/front-matter/
[Jekyll configuration]: https://jekyllrb.com/docs/configuration/
[source file for this page]: https://github.com/just-the-docs/just-the-docs/blob/main/index.md
[CHAMP]: https://trex-coe.github.io/champ-user-manual/
[CHAMP repo]: https://github.com/filippi-claudia/champ
[Just the Docs README]: https://github.com/just-the-docs/just-the-docs/blob/main/README.md
[GitHub Pages]: https://pages.github.com/
[Template README]: https://github.com/just-the-docs/just-the-docs-template/blob/main/README.md
[GitHub Pages / Actions workflow]: https://github.blog/changelog/2022-07-27-github-pages-custom-github-actions-workflows-beta/
