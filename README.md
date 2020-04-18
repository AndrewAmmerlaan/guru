**This document is a draft, which is why it is in this fork for now**

# GURU Project Repository

The official repository for new Gentoo packages that are maintained collaboratively by Gentoo users. See [wiki.gentoo.org/wiki/Project:GURU](https://wiki.gentoo.org/wiki/Project:GURU) for more information on the project.

This README contains some additional useful information for GURU contributors, such as common mistakes and frequently asked questions. The [GURU regulations](https://wiki.gentoo.org/wiki/Project:GURU#The_regulations), and the Gentoo [developer manual](https://devmanual.gentoo.org/) take precedence over any information here.

### Contents

1. [Frequently Asked Questions](#FAQ)
2. [Common Mistakes](#CommMist)
3. [Useful Links](#links)
4. [Email Addresses](#email)

## Frequently Asked Questions <a name="FAQ"></a>

- #### How do I contribute?

See [wiki.gentoo.org/wiki/Project:GURU/Information_for_Contributors](https://wiki.gentoo.org/wiki/Project:GURU/Information_for_Contributors)

- #### What are the rules and regulations?

See [wiki.gentoo.org/wiki/Project:GURU#The_regulations](https://wiki.gentoo.org/wiki/Project:GURU#The_regulations)

- #### What does GURU stand for?

This is very secret, but you might find a clue [here](https://dev.gentoo.org/~mgorny/articles/guru-a-new-model-of-contributing-to-gentoo.html#the-acronym).

- #### [GLEP 63](https://www.gentoo.org/glep/glep-0063.html) says I should use a @gentoo.org email address for signing off, do I need an @gentoo.org email address to contribute to GURU?

No, you do not need an @gentoo.org email address to contribute to GURU, these email addresses are for Gentoo developers only. Instead use whichever email address you want to receive bug mail and other communications on. If you're also a [proxy-maintainer](https://wiki.gentoo.org/wiki/Project:Proxy_Maintainers) please use the same email address.

- #### Can I use RESTRICT="mirror"?

Sure, since GURU packages are not mirrored on the [Gentoo mirrors](https://devmanual.gentoo.org/general-concepts/mirrors/index.html) anyway, it makes no difference. You can use RESTRICT="mirror" to avoid unnecessary fetch attempts. This is not required by GURU nor is it prohibited, just be sure to remove it if you want to move your package to the main Gentoo repository.

- #### I need help, where do I go?

You can reach other GURU contributors on [IRC #gentoo-guru](https://webchat.freenode.net/?channels=gentoo-guru), by emailing guru-committers@gentoo.org, or by opening an [issue on our GitHub](https://github.com/gentoo/guru/issues)

- #### I found a bug, what do I do?

You can either contact the GURU contributors using one of the options in the previous point, or you can open a bug on the bug tracker: [bugs.gentoo.org/enter_bug.cgi?product=GURU](https://bugs.gentoo.org/enter_bug.cgi?product=GURU)

- #### I found a bug in a package that I do not maintain, and I know how to fix it, can I fix it myself?

As per [the regulations](https://wiki.gentoo.org/wiki/Project:GURU#The_regulations), yes, you can! Just be sure to maintain respectful and professional behaviour.

- #### Can I commit a package without listing myself as explicit maintainer?

As per [the regulations](https://wiki.gentoo.org/wiki/Project:GURU#The_regulations), yes, you can.

- #### I want to make changes to this document, can I?

Please discuss any changes and additions to this document in an [issue on our GitHub](https://github.com/gentoo/guru/issues) prior to committing them.


## Common Mistakes <a name="CommMist"></a>

- #### Gentoo projects shouldn't be in the metadata files

Please don't put Gentoo projects (e.g. the proxy-maint project) in the metadata.xml files. Gentoo projects and developers are **not** responsible for the packages in GURU, as such they should not be listed in the metadata files.

When moving a package from a Pull Request in the [main Gentoo Repository](https://github.com/gentoo/gentoo) to GURU it is easy to forget to remove the [proxy-maint](https://wiki.gentoo.org/wiki/Project:Proxy_Maintainers) project from the metadata.xml file. The same is true for moving from GURU to a ::gentoo Pull Request, if you forget to add proxy-maint to the metadata file the `gentoo-repo-qa-bot` will complain.

- #### Use the cmake eclass instead of the cmake-utils eclass

The [cmake-utils eclass](https://devmanual.gentoo.org/eclass-reference/cmake-utils.eclass/index.html) will be deprecated in favour of the [cmake eclass](https://devmanual.gentoo.org/eclass-reference/cmake.eclass/index.html). To make your ebuilds more future proof, you might want to use the cmake eclass instead. These eclasses are functionally equivalent, so replacing references to `cmake-utils_....` with `cmake_....` should just work.

- #### Use the latest EAPI whenever possible

Since the packages in GURU are all 'new packages' (not in ::gentoo). It is good practice to use the latest [EAPI](https://devmanual.gentoo.org/ebuild-writing/eapi/index.html) (7 at the moment), this makes your ebuilds more future proof.

- #### Use repoman for committing

Avoid using `git commit -S` for committing, use `repoman ci` instead. [Repoman](https://wiki.gentoo.org/wiki/Repoman) does additional checks and regenerates the manifest before committing.

In GURU we use ['thin manifests'](https://wiki.gentoo.org/wiki/Repository_format/package/Manifest#Thin_Manifest). Because this is not the default, manifest files should be regenerated when moving a package from another overlay that does not use thin manifests (including your [local overlay](https://wiki.gentoo.org/wiki/Custom_repository) unless it is also configured to use thin manifests).

- #### `repoman -dx full`

Running `repoman -dx full` in the directory your ebuild is in will preform some basic checks on your ebuild. Please try to make `repoman -dx full` as happy as possible before committing.

- #### Tests and documentation for Python packages.

Many Python packages have tests and documentation. Unlike some other eclasses the [distutils-r1 eclass](https://devmanual.gentoo.org/eclass-reference/distutils-r1.eclass/index.html) does not enable support for these tests automatically. This is because there are multiple test runners available for Python. To enable tests for your Python ebuilds, use the `distutils_enable_tests <test-runner>` function. Similarly, support for documentation building with Sphinx can be added with the `distutils_enable_sphinx <subdir> [--no-autodoc | <plugin-pkgs>...]` function. Please note that these functions already append to IUSE and RESTRICT, so there is no need to specify this manually. See the [dev manual](https://devmanual.gentoo.org/eclass-reference/distutils-r1.eclass/index.html) for more information.

## Useful Links <a name="links"></a>

- https://wiki.gentoo.org/wiki/Project:GURU
- https://wiki.gentoo.org/wiki/Project:GURU/Information_for_Contributors
- https://wiki.gentoo.org/wiki/Project:GURU/Information_for_Trusted_Contributors
- https://wiki.gentoo.org/wiki/Basic_guide_to_write_Gentoo_Ebuilds
- https://devmanual.gentoo.org/quickstart
- https://devmanual.gentoo.org/ebuild-writing
- https://devmanual.gentoo.org/ebuild-writing/variables
- https://devmanual.gentoo.org/function-reference
- https://devmanual.gentoo.org/function-reference/install-functions


## Email Addresses <a name="email"></a>

- guru@gentoo.org (Reach everyone involved in GURU)
- guru-committers@gentoo.org (Reach all contributors)
- guru-trusted@gentoo.org (Reach the [trusted contributors](https://wiki.gentoo.org/wiki/Project:GURU/Information_for_Trusted_Contributors))
- guru-devs@gentoo.org (Reach the Gentoo developers involved in GURU)
