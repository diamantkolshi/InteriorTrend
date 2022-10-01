import React, { createContext, FormEvent, ReactNode, useContext, useEffect, useState } from 'react';
import { Button, Form, ModalBody, ModalFooter, ModalHeader } from "reactstrap";

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

interface CardFormModalProps {
    onSubmit: (e:FormEvent<HTMLFormElement>) => void;
    toggleModal: (e:FormEvent<HTMLFormElement>) => void;
    onBack?: (e:React.MouseEvent<any, MouseEvent>) => void;
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
        label:'saved',
        color: 'success'
    },
    ERROR: {
        label: 'error',
        color: 'danger'
    }
}

const CardFormModalButtonConfig = createContext<BtnContextProps>(DEFAULT_BTN_CONFIG);

export const WithCustomButtonConfig:React.FC<{idle?: BtnConfig }> = ({idle, children}) => {
    const config = {...DEFAULT_BTN_CONFIG};
    if(idle) {
        config.IDLE = idle;
    }
    return (
        <CardFormModalButtonConfig.Provider value={config}>
        {children}
    </CardFormModalButtonConfig.Provider>
)
}

const CardFormModal:React.FC<CardFormModalProps> = ({onSubmit, toggleModal, onBack, title, errors, children, nonHeader = false, ...other}) => {
    const [formState, setFormState] = useState<string>('IDLE');
    const btnConfig = useContext(CardFormModalButtonConfig);
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
      <ModalHeader toggle={toggleModal}>{title}</ModalHeader>
      <ModalBody>{children}</ModalBody>
      <ModalFooter className="justify-content-between d-flex">
        {onBack ? <Button color="secondary" onClick={onBack}>
          Zurück
        </Button> : <span />}
        <Button type="submit" color={currentBtnConfig.color} disabled={formState === 'SAVING'}>
          {currentBtnConfig.label}
        </Button>
      </ModalFooter>
    </Form>
)
};

export default CardFormModal;
