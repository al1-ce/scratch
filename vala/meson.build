project('dummy', 'vala', 'c')
dependencies = [
    dependency('gtk+-3.0'),
    dependency('gobject-2.0'),
    dependency('glib-2.0'),
]
sources = files(
    'src/other/test.vala',
    'src/main.vala',
    'src/templ.vala',
    'src/other/myc.c',
)
executable('dummy', sources: sources, dependencies: dependencies)
