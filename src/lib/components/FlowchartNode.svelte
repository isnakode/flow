<script lang="ts">
    import type { SymbolData } from "$lib/SymbolData";
    import {
        Handle,
        Position,
        useSvelteFlow,
        type Node,
        type NodeProps,
    } from "@xyflow/svelte";
    let rows = $derived.by(() => {
        const matches = (data.label ?? "").match(/\n/g); // Finds all \n
        return matches ? matches.length + 1 : 1;
    });
    const { updateNodeData } = useSvelteFlow();
    const { data, id, selected }: NodeProps<Node<SymbolData>> = $props();
    const svgClass = $derived(
        `text-base-200 text-sm flex justify-center items-center stroke-2 transition-all group ${
            selected
                ? "stroke-emerald-700"
                : "stroke-zinc-700 hover:stroke-zinc-600"
        }`,
    );
</script>

<div class="group">
    {#if data.type == "start"}
        <svg
            width="120"
            height="50"
            viewBox="-1 -1 122 52"
            fill="none"
            style="color: {data.background};"
            class={svgClass}
        >
            <path
                d="M95 0C108.809 0 120 11.191 120 25L120 25C120 38.809 108.809 50 95 50L25 50C11.191 50 0 38.809 0 25L0 25C0 11.191 11.191 0 25 0L95 0Z"
                fill="currentcolor"
            />
        </svg>
    {:else if data.type == "process"}
        <svg
            viewBox="-1 -1 122 72"
            width="120"
            height="70"
            style="color: {data.background};"
            class={svgClass}
        >
            <rect width="120" height="70" fill="currentcolor" />
        </svg>
    {:else if data.type == "db"}
        <svg
            viewBox="0 0 62 62"
            class="text-base-200 text-sm flex justify-center items-center stroke-2 size-24 group"
        >
            <path
                d="M 1 51 L 1 11 C 1 5.48 14.43 1 31 1 C 47.57 1 61 5.48 61 11 L 61 51 C 61 56.52 47.57 61 31 61 C 14.43 61 1 56.52 1 51 Z"
                fill="currentColor"
                style="color: {data.background};"
                class={svgClass}
                stroke-width="1"
            />
            <path
                d="M 1 11 C 1 16.52 14.43 21 31 21 C 47.57 21 61 16.52 61 11"
                fill="currentColor"
                style="color: {data.background};"
                class={svgClass}
                stroke-width="1"
            />
        </svg>
    {:else if data.type == "io"}
        <svg width="100" height="60" viewBox="-1 -1 102 62" overflow="visible">
            <path
                d="M10.8352 0L100 0L89.1649 60L0 60L10.8352 0Z"
                fill="currentColor"
                stroke-linejoin="round"
                stroke-width="2"
                style="color: {data.background};"
                class={svgClass}
            />
        </svg>
    {:else if data.type == "branch"}
        <svg
            viewBox="-1 -1 102 102"
            width="100"
            height="100"
            xmlns="http://www.w3.org/2000/svg"
            class="text-base-200 text-sm"
        >
            <polygon
                points="50,0 100,50 50,100 0,50"
                fill="currentcolor"
                style="color: {data.background};"
                class={svgClass}
            />
        </svg>
    {:else if data.type == "offpage"}
        <svg width="120" height="116" viewBox="-1 -1 122 117" fill="none">
            <path
                d="M0 0L120 0L120 72.1066L59.9999 116L0 72.1066L0 0Z"
                fill="currentColor"
                fill-rule="evenodd"
                style="color: {data.background};"
                class={svgClass}
            >
            </path>
        </svg>
    {:else if data.type == "onpage"}
        <svg width="61" height="61" viewBox="-1 -1 63 63" fill="none">
            <path
                d="M0 30.5C0 13.6553 13.6553 0 30.5 0C47.3447 0 61 13.6553 61 30.5C61 47.3447 47.3447 61 30.5 61C13.6553 61 0 47.3447 0 30.5Z"
                fill="currentColor"
                fill-rule="evenodd"
                style="color: {data.background};"
                class={svgClass}
            />
        </svg>
    {:else if data.type == "document"}
        <svg width="112.5" height="60" viewBox="-1 -1 113 62" fill="none">
            <path
                d="M0 0L112.5 0C112.5 0 112.5 55.08 112.5 55.08C56.25 32.5688 56.25 78.2288 0 51.0881C0 51.0881 0 0 0 0Z"
                fill="currentColor"
                fill-rule="evenodd"
                style="color: {data.background};"
                class={svgClass}
            />
        </svg>
    {/if}

    <textarea
        style="font-size: {data.labelSize}px;"
        oninput={(e) => {
            updateNodeData(id, { label: e.currentTarget.value });
        }}
        class="text-center outline-none resize-none text-gray-300 absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 h-auto"
        {rows}>{data.label}</textarea
    >
    <Handle
        id="a"
        type="source"
        position={Position.Top}
        class="bg-transparent! size-2! border-none! rounded-full! group-hover:bg-gray-400! transition-all"
    />
    <Handle
        id="b"
        type="source"
        position={Position.Bottom}
        class="bg-transparent! size-2! border-none! rounded-full! group-hover:bg-gray-400! transition-all"
    />
    <Handle
        id="c"
        type="source"
        position={Position.Left}
        class="bg-transparent! size-2! border-none! rounded-full! group-hover:bg-gray-400! transition-all"
    />
    <Handle
        id="d"
        type="source"
        position={Position.Right}
        class="bg-transparent! size-2! border-none! rounded-full! group-hover:bg-gray-400! transition-all"
    />
</div>
