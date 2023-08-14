import { writable } from 'svelte/store';
export const showSidebar = writable(false);

export function handleSidebar() {
    showSidebar.update((show) => !show);
}
