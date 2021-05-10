from django.http import JsonResponse
import requests, json

def jokes(request):
    """
    return j
    """
    jokes, count = _fetch_data()
    return JsonResponse({"count": count, "jokes": jokes})

def _clean_data(data):
    clean = {}
    if len(data):
        clean['id'], clean['link'] = data[0].split(" ")
        clean["joke"] = data[1:]
    return clean


def _fetch_data():
    data_link = "http://bash.org.pl/text"
    # make use of persistance
    session_object = requests.Session()
    # stream text file and leave connection open
    response_data = session_object.get(data_link, stream=True)

    all_jokes = []

    if response_data.status_code == 200:
        jokes_count = 0
        raw_joke = []
        # iterate through all the data and process json response
        with response_data as raw_data:
            for data_line in raw_data.iter_lines():
                if data_line.decode("utf-8") != "%":
                    if data_line.decode("utf-8") != "":
                        # store temp complete joke
                        raw_joke.append(data_line.decode("utf-8"))
                else:
                    if jokes_count <= 99:
                        # process temp joke and add to collection
                        all_jokes.append(_clean_data(raw_joke))
                        raw_joke.clear()
                    else:
                        break
                    jokes_count += 1
        return all_jokes, len(all_jokes)
    else:
         return {"error": response_data.status_code}
