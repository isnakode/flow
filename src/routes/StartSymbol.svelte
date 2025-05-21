<script lang="ts">
    import { Handle, Position, type NodeProps } from "@xyflow/svelte";
    let actionChoice = $state("makedir");

    const { data, id, selected }: NodeProps = $props();
</script>

<button
    class="text-sm min-w-24 min-h-8 flex justify-center items-center rounded-full bg-zinc-900 ring-2 {selected
        ? 'ring-emerald-700'
        : 'ring-transparent hover:ring-zinc-600'} p-2 text-gray-300 transition-all"
>
    Halo
    <Handle
        id="start-a"
        type="source"
        position={Position.Top}
        class="bg-gray-400! size-2! border-none! rounded-full!"
    />
    <Handle
        id="start-b"
        type="source"
        position={Position.Bottom}
        class="bg-gray-400! size-2! border-none! rounded-full!"
    />
    <Handle
        id="start-c"
        type="source"
        position={Position.Left}
        class="bg-gray-400! size-2! border-none! rounded-full!"
    />
    <Handle
        id="start-d"
        type="source"
        position={Position.Right}
        class="bg-gray-400! size-2! border-none! rounded-full!"
    />
</button>
