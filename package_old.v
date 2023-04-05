module main

import time

[json: 'package']
pub struct PackageOld {
pub mut:
	id        int
	author_id int
	github_id int

	name          string
	description   string
	documentation string
	repository    string
	license       string

	vcs string
	url string

	stars         int
	downloads     int
	downloaded_at time.Time = time.now()
	// Do not feature it on homepage
	is_hidden bool
	// No need to mention author of package, example `ui`
	is_flatten bool

	created_at time.Time = time.now()
	updated_at time.Time = time.now()

	author User
}

pub struct FullPackage {
	Package
pub mut:
	author     User
	categories []Category
}

pub fn (p FullPackage) format_name() string {
	return if p.is_flatten {
		p.name
	} else {
		'${p.author.username}.${p.name}'
	}
}

pub struct PackagesView {
pub mut:
	total_count               int
	new_packages              []FullPackage
	most_downloaded_packages  []FullPackage
	recently_updated_packages []FullPackage
}

// Backward compatibility for V <=0.3
pub struct OldPackage {
pub mut:
	id           int
	name         string
	vcs          string = 'git'
	url          string
	nr_downloads int
}
