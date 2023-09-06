void normalizePolynomial(ptr& first) {
    if (first == nullptr) {
        return; 
    }

    ptr current = first;
    ptr previous =nullptr;

    while (now) 
    {
        int currentExp = current->exp;
        double sum = current->coef;
        ptr temp = current;
        ptr pretemp = current;
        if (temp->next != nullptr) 
        {
            while (temp->next != nullptr) 
            {
                temp = temp->next;
                while(temp->exp  == currentExp) 
                {
                    sum+= temp->coef;
                    if (temp->next != nullptr) 
                    {
                        temp = temp->next;
                        pretemp->next = temp;
                    }
                    else 
                    {
                        pretemp->next = nullptr;
                        break;
                    }
                }
                pretemp = temp;
            }
        }
        else break;
        if (sum == 0) 
        {
            if (previous == nullptr) 
            {
                first = first->next;
            } 
            else 
            {
                previous->next = current->next;
            }
            ptr temp = current;
            if (current->next!=nullptr) current = current->next;
            else break;
            delete temp;
        }
        else 
        {
            current->coef = sum;
            previous = current;
            if (current->next!=nullptr) current = current->next;
            else break;
        }
    }
}

ptr create (double coef, int exp)
 {
     Item *newItem = new Item;
     newItem -> coef=coef;
     newItem -> exp = exp;
     newItem -> next =NULL;
     return newItem;
    
 }

ptr inputPolynomial() 
{
    Item* head = NULL;
    double coef; 
    int exp;
    
    //cin >> coef;
    //cin >> exp;
    //if (coef == 0) return nullptr;

    while (true)
    {
        cin >> coef;
        cin >> exp;
        if ( coef != 0)
        {

        Item *newItem=create(coef, exp);
        newItem -> next=head;
        head = newItem;
        }
        else break;
        
    }
    return head;
    //else break;
    
}
