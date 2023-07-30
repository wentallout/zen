import { writable } from 'svelte/store';

console.log('test');

export const showSidebar = writable(false);
