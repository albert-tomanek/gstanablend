project('anablend', 'vala', 'c')

libmu_dep = subproject('libmu').get_variable('libmu_dep')

deps = [
	dependency('glib-2.0'),
	dependency('gobject-2.0'),
    dependency('gstreamer-1.0'),
	dependency('gstreamer-base-1.0'),
	libmu_dep
]

demo = library(
	'gstanablend',
	sources: [
        'main.vala',
    ],
	dependencies: deps,

    install: true,
    install_dir : '/usr/lib64/gstreamer-1.0',
)