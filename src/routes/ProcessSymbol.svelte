<script lang="ts">
    import { Handle, Position, type NodeProps } from "@xyflow/svelte";
    let actionChoice = $state("makedir");

    const { data, id, selected }: NodeProps = $props();
</script>

<button
    class="text-sm min-w-32 min-h-18 flex justify-center items-center bg-zinc-900 ring-2 {selected
        ? 'ring-emerald-700'
        : 'ring-transparent hover:ring-zinc-600'} p-4 text-gray-300 transition-all"
>
    Halo
    <Handle
        id="process-a"
        type="source"
        position={Position.Top}
        class="bg-gray-400! size-2! border-none! rounded-full!"
    />
    <Handle
        id="process-b"
        type="source"
        position={Position.Bottom}
        class="bg-gray-400! size-2! border-none! rounded-full!"
    />
    <Handle
        id="process-c"
        type="source"
        position={Position.Left}
        class="bg-gray-400! size-2! border-none! rounded-full!"
    />
    <Handle
        id="process-d"
        type="source"
        position={Position.Right}
        class="bg-gray-400! size-2! border-none! rounded-full!"
    />
</button>
