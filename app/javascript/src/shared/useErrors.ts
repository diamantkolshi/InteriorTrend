import { usePage } from "@inertiajs/inertia-react";

const useErrors = (key) => {
    const { errors }: any = usePage().props
    if(errors) {
        return errors[key] || {};
    }
    return {};
};

export default useErrors;
