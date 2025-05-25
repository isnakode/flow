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
</script>

<div class="group">
    <svg
        viewBox="-1 -1 122 72"
        width="120"
        height="70"
        style="color: {data.background};"
        class="text-base-200 text-sm flex justify-center items-center stroke-2 {selected
            ? 'stroke-emerald-700'
            : 'stroke-transparent hover:stroke-zinc-600'} transition-all group"
    >
        <rect width="120" height="70" fill="currentcolor" />
    </svg>
    <textarea
        style="font-size: {data.labelSize}px;"
        oninput={(e) => {
            updateNodeData(id, { label: e.currentTarget.value });
        }}
        class="text-center outline-none resize-none text-gray-300 absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 h-auto"
        {rows}>{data.label}</textarea
    >
    <Handle
        id="process-a"
        type="source"
        position={Position.Top}
        class="bg-transparent! size-2! border-none! rounded-full! group-hover:bg-gray-400! transition-all"
    />
    <Handle
        id="process-b"
        type="source"
        position={Position.Bottom}
        class="bg-transparent! size-2! border-none! rounded-full! group-hover:bg-gray-400! transition-all"
    />
    <Handle
        id="process-c"
        type="source"
        position={Position.Left}
        class="bg-transparent! size-2! border-none! rounded-full! group-hover:bg-gray-400! transition-all"
    />
    <Handle
        id="process-d"
        type="source"
        position={Position.Right}
        class="bg-transparent! size-2! border-none! rounded-full! group-hover:bg-gray-400! transition-all"
    />
</div>
