echo "Remember to reexport the build profile."

scons platform=linuxbsd use_llvm=yes target=editor module_mono_enabled=yes
# scons target=template_release disable_physics_2d=yes module_regex_enabled=no module_svg_enabled=no lto=full optimize=size_extra build_profile=profile.gdbuild

bin/godot.linuxbsd.editor.x86_64.mono --headless --generate-mono-glue modules/mono/glue
./modules/mono/build_scripts/build_assemblies.py --godot-output-dir ./bin --push-nupkgs-local /home/frida/.nuget/MyLocalNugetSource/ --godot-platform=linuxbsd
