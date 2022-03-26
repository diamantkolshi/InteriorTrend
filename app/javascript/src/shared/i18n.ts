const i18n = ((window as any).i18n || {});
export const t = (...keys:string[]) => {
    const ks = [...keys];
    let current = i18n;
    while(ks.length > 0) {
        current = current[ks.shift()];
    }
    return current;
};

export const withScope = (...scopeKeys: string[]) =>
    (...keys: string[]) =>
    t.apply(this, [...scopeKeys, ...keys]);

export const l = (key) => {
    return "TODO";
};

export const formatNumber = (number, options = {}) => {
    return new Intl.NumberFormat('sq-SQ', options).format(number)
}
