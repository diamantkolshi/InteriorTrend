import { usePage } from "@inertiajs/inertia-react";

const useErrors = (key) => {
    const {errors} = usePage();
    if(errors) {
        return errors[key] || {};
    }
    return {};
};

export default useErrors;
