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
        <svg
            width="120"
            height="64"
            viewBox="-1 -1 122 66"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
        >
            <path
                d="M0 0L120 0C120 0 120 58.752 120 58.752C60 34.74 60 83.444 0 54.494C0 54.494 0 0 0 0Z"
                fill="currentColor"
                fill-rule="evenodd"
                style="color: {data.background};"
                class={svgClass}
            />
        </svg>
    {:else if data.type == "preprocess"}
        <svg
            width="121"
            height="61"
            viewBox="0 0 121 61"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
        >
            <g transform="translate(0.5 0.5)">
                <path
                    d="M0 0L120 0L120 60L0 60L0 0Z"
                    fill="currentColor"
                    fill-rule="evenodd"
                    style="color: {data.background};"
                    class={svgClass}
                />
                <path
                    d="M0 0L0 60L0 0ZM88 0L88 60L88 0Z"
                    fill="currentColor"
                    fill-rule="evenodd"
                    style="color: {data.background};"
                    class={svgClass}
                    transform="translate(16 0)"
                />
            </g>
        </svg>
    {:else if data.type == "instore"}
        <svg
            width="121"
            height="61"
            viewBox="0 0 121 61"
            fill="currentColor"
            fill-rule="evenodd"
            xmlns="http://www.w3.org/2000/svg"
        >
            <g transform="translate(0.5 0.5)">
                <path
                    d="M0 0L120 0L120 60L0 60L0 0Z"
                    style="color: {data.background};"
                    class={svgClass}
                />
                <path
                    d="M2 0L2 60L2 0Z"
                    style="color: {data.background};"
                    class={svgClass}
                    transform="translate(14 0)"
                />
                <path
                    d="M0 0L120 0L0 0Z"
                    style="color: {data.background};"
                    class={svgClass}
                    transform="translate(0 16)"
                />
            </g>
        </svg>
    {:else if data.type == "looplimit"}
        <svg
            width="120"
            height="60"
            viewBox="-1 -1 122 62"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
        >
            <path
                d="M0 16L16 0L104 0L120 16L120 60L0 60L0 16Z"
                fill="currentColor"
                fill-rule="evenodd"
                style="color: {data.background};"
                class={svgClass}
            />
        </svg>
    {:else if data.type == "manualloop"}
        <svg
            width="120"
            height="60"
            viewBox="-1 -1 122 62"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
        >
            <path
                d="M0 0L16 60L104 60L120 0L0 0Z"
                fill="currentColor"
                fill-rule="evenodd"
                style="color: {data.background};"
                class={svgClass}
            />
        </svg>
    {:else if data.type == "directdata"}
        <svg
            width="120"
            height="59.756"
            viewBox="-1 -1 122 61"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
        >
            <g transform="translate(0.5 0.5)">
                <path
                    d="M9.55764 58.756C4.97859 58.756 0 46.1646 0 29.378C0 12.5914 4.97859 0 9.55764 0C9.55764 0 109.913 0 109.913 0C105.134 0 100.355 12.5914 100.355 29.378C100.355 46.1646 105.134 58.756 109.913 58.756C109.913 58.756 9.55764 58.756 9.55764 58.756Z"
                    fill-rule="evenodd"
                    fill="currentColor"
                    style="color: {data.background};"
                    class={svgClass}
                />
                <path
                    d="M9.55764 58.756C4.77882 58.756 0 46.1646 0 29.378C0 12.5914 4.77882 0 9.55764 0C14.3365 0 19.1153 12.5914 19.1153 29.378C19.1153 46.1646 14.3365 58.756 9.55764 58.756C9.55764 58.756 9.55764 58.756 9.55764 58.756Z"
                    fill="currentColor"
                    fill-rule="evenodd"
                    style="color: {data.background};"
                    class={svgClass}
                    transform="translate(99.885 0)"
                />
            </g>
        </svg>
    {:else if data.type == "manualinput"}
        <svg
            width="120"
            height="72"
            viewBox="-1 -1 122 74"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
        >
            <path
                d="M0 25.412L120 0L120 72L0 72L0 25.412Z"
                fill-rule="evenodd"
                fill="currentColor"
                style="color: {data.background};"
                class={svgClass}
            />
        </svg>
    {:else if data.type == "multidoc"}
        <svg
            width="120"
            height="71.526"
            viewBox="-1 -1 122 73.526"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
        >
            <g>
                <path
                    d="M0 0L112 0C112 0 112 58.3173 112 58.3173C56 34.4844 56 82.8261 0 54.0915C0 54.0915 0 0 0 0Z"
                    fill="currentColor"
                    style="color: {data.background};"
                    class={svgClass}
                    fill-rule="evenodd"
                    transform="translate(8 0)"
                />
                <path
                    d="M0 0L112 0C112 0 112 58.3173 112 58.3173C56 34.4844 56 82.8261 0 54.0915C0 54.0915 0 0 0 0Z"
                    fill="currentColor"
                    style="color: {data.background};"
                    class={svgClass}
                    fill-rule="evenodd"
                    transform="translate(4 4)"
                />
                <path
                    d="M0 0L112 0C112 0 112 58.3173 112 58.3173C56 34.4844 56 82.8261 0 54.0915C0 54.0915 0 0 0 0Z"
                    fill="currentColor"
                    style="color: {data.background};"
                    class={svgClass}
                    fill-rule="evenodd"
                    transform="translate(0 8)"
                />
            </g>
        </svg>
    {:else if data.type == "prep"}
        <svg
            width="120"
            height="60"
            viewBox="-1 -1 122 62"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
        >
            <path
                d="M16 60L0 30L16 0L104 0L120 30L104 60L16 60Z"
                fill="currentColor"
                style="color: {data.background};"
                class={svgClass}
                fill-rule="evenodd"
            />
        </svg>
    {:else if data.type == "display"}
        <svg
            width="120"
            height="59.016"
            viewBox="-1 -1 122 61.016"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
        >
            <path
                d="M24 59.0164L0 29.5082L24 0C24 0 92.0007 0 92.0007 0C108 0 120 12.6472 120 29.5082C120 46.3692 108 59.0164 92.0006 59.0164C92.0006 59.0164 24 59.0164 24 59.0164Z"
                fill="currentColor"
                style="color: {data.background};"
                class={svgClass}
            />
        </svg>
    {:else if data.type == "saveddata"}
        <svg
            width="120"
            height="60"
            viewBox="-1 -1 122 62"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
        >
            <path
                d="M30.4 60C14.4 60 0 47.142 0 30C0 12.858 14.4 0 30.4 0C30.4 0 120 0 120 0C101.333 20 101.333 40 120 60C120 60 30.4 60 30.4 60Z"
                fill="currentColor"
                style="color: {data.background};"
                class={svgClass}
            />
        </svg>
    {:else if data.type == "delay"}
        <svg
            width="120"
            height="59.507"
            viewBox="-1 -1 122 61.507"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
        >
            <path
                d="M0 0C0 0 91.9993 0 91.9993 0C108 0 120 12.7524 120 29.7536C120 46.7548 108 59.5073 91.9993 59.5073C91.9993 59.5073 0 59.5073 0 59.5073L0 0Z"
                fill="currentColor"
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
