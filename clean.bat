@echo off

echo Removing build folder...
rmdir /s /q "build"

echo Removing .svelte-kit folder...
rmdir /s /q ".svelte-kit"

echo Removing .netlify folder...
rmdir /s /q ".netlify"

echo Folders removed successfully!
pause