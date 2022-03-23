import React from "react";
import { FormFeedback, FormGroup, Label, Input, InputGroup, InputGroupAddon, InputGroupText } from "reactstrap";

interface CFormGroupI {
    id: string;
    label?: string;
    tag: string | React.ReactType;
    error: any;
    groupAttributes?: any;
    [key:string]: any;
}

const CFormGroup: React.FC<CFormGroupI> = ({id, label, tag, error, groupAttributes = {}, append, wrapper = (input) => input, children, bsSize, ...other}) => {
    let Factory = tag;
    let otherParams = other

    if(tag === 'textarea') {
      Factory = Input;
      otherParams = {...other, type: "textarea"}
    }

    let currentWrapper = wrapper;
    if(append) {
        currentWrapper = (input) => (<InputGroup>
            {input}
            <InputGroupAddon addonType="append">
                <InputGroupText>{append}</InputGroupText>
            </InputGroupAddon>
        </InputGroup>);
    }

    return (
        <FormGroup {...groupAttributes}>
            {label && <Label for={id}>{label}</Label>}
            {currentWrapper(<Factory id={id} bsSize={bsSize} name={id} invalid={!!error} {...otherParams}>
                {children}
            </Factory>)}
            {error && <FormFeedback valid={false} className="d-block">{error[0]}</FormFeedback>}
        </FormGroup>
    )
};

export default CFormGroup;
