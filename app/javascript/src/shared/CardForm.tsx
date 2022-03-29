import React, { createContext, FormEvent, ReactNode, useContext, useEffect, useState } from 'react';
import { Button, Card, CardBody, CardFooter, CardHeader, Form } from "reactstrap";

interface BtnConfig {
    label: string;
    color: string;
}

interface BtnContextProps {
    IDLE: BtnConfig,
    SAVING: BtnConfig,
    SUCCESS: BtnConfig,
    ERROR: BtnConfig,
}

interface CardFormProps {
    onSubmit: (e:FormEvent<HTMLFormElement>) => void;
    title: ReactNode | string;
    errors?: {
        [key:string]: any;
    };
    success?: boolean;
    className?: string;
    nonHeader?: boolean;
}

const DEFAULT_BTN_CONFIG = {
    IDLE: {
        label: 'save',
        color: 'primary'
    },
    SAVING: {
        label: 'saving',
        color: 'primary'
    },
    SUCCESS: {
        label: 'saved',
        color: 'success'
    },
    ERROR: {
        label: 'error',
        color: 'danger'
    }
}

const CardFormButtonConfig = createContext<BtnContextProps>(DEFAULT_BTN_CONFIG);

export const WithCustomButtonConfig:React.FC<{idle?: BtnConfig }> = ({idle, children}) => {
    const config = {...DEFAULT_BTN_CONFIG};
    if(idle) {
        config.IDLE = idle;
    }
    return (
        <CardFormButtonConfig.Provider value={config}>
        {children}
    </CardFormButtonConfig.Provider>
)
}

const CardForm:React.FC<CardFormProps> = ({onSubmit, title, errors, children, nonHeader = false, ...other}) => {
    const [formState, setFormState] = useState<string>('IDLE');
    const btnConfig = useContext(CardFormButtonConfig);
    useEffect(() => {
        if(formState === 'SAVING') {
            if(Object.keys(errors).length > 0) {
                setFormState('ERROR');
            } else {
                setFormState('SUCCESS');
            }
            setTimeout(() => {
                setFormState('IDLE');
            }, 3000);
        }
    }, [errors]);

    const handleSubmit = (e) => {
        e.preventDefault();
        setFormState('SAVING');
        onSubmit(e);
    };

    const currentBtnConfig = btnConfig[formState];

    return (
    <Form onSubmit={handleSubmit} {...other}>
        <Card>
            { nonHeader !== true && <CardHeader>
                <h6 className="m-0 font-weight-bold text-primary">{title}</h6>
            </CardHeader>}
            <CardBody>
                {children}
            </CardBody>
            <CardFooter className="justify-content-between d-flex">
                <Button type="submit" className="ml-auto" color={currentBtnConfig.color} disabled={formState === 'SAVING'}>
                    {currentBtnConfig.label}
                </Button>
            </CardFooter>
        </Card>
    </Form>
)
};

export default CardForm;
