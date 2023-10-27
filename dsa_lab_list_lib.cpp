#include <iostream>
#include <list>
using namespace std;

class DataLog
{
private:
    list<int> logList;
    list<int>::iterator currentState;

public:
    DataLog();
    DataLog(const int &data);
    void addCurrentState(int number);
    void subtractCurrentState(int number);
    void save();
    void undo();
    void redo();

    int getCurrentStateData()
    {
        return *currentState;
    }

    void printLog()
    {
        for (auto i = logList.begin(); i != logList.end(); i++)
        {
            if (i == currentState)
                cout << "Current state: ";
            cout << "[ " << *i << " ] => ";
        }
        cout << "END_LOG" << endl;
    }
};

DataLog::DataLog()
{
    logList.push_front(0);
    currentState = logList.begin();
}

DataLog::DataLog(const int &data)
{
    logList.push_front(data);
    currentState = logList.begin();
}

void DataLog::addCurrentState(int number)
{
    *currentState += number;//add value at current
}

void DataLog::subtractCurrentState(int number)
{
    *currentState -= number;//subtract value at current
}

void DataLog::save()
{
    int temp = *currentState;
    auto it = ++currentState;
    while (it != logList.end())
    {
        it = logList.erase(it);
    }
    logList.push_back(temp);
    currentState = prev(logList.end());
}

void DataLog::undo()
{
    if (currentState != logList.begin())
    {
        currentState--;
    }
}

void DataLog::redo()
{
    auto it = prev(logList.end());
    if (currentState != it)
    {
        currentState++;
    }
}

int main()
{
    DataLog log(10);
    log.save();
    log.addCurrentState(15);
    log.save();
    log.addCurrentState(15);
    log.undo();
    log.printLog();

    return 0;
}
